#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Install agent-engineering into a host repository.

Usage:
  scripts/install.sh --target /path/to/host-repo [options]

Options:
  --target PATH           Host repository root. Required.
  --runtimes LIST         Comma-separated runtimes: codex,claude,both,none.
                          Default: both
  --preset NAME           Review preset to copy to review.local.md.
                          Use one of: all-principles, minimal, quality-and-security,
                          llm-systems, none. Default: all-principles
  --mode MODE             Install mode: copy or symlink. Default: symlink
  --force                 Overwrite existing destination paths.
  --dry-run               Print planned actions without writing files.
  --help                  Show this message.

Examples:
  scripts/install.sh --target ~/code/my-repo
  scripts/install.sh --target ~/code/my-repo --mode copy --runtimes codex
  scripts/install.sh --target ~/code/my-repo --preset minimal --dry-run
EOF
}

log() {
  printf '%s\n' "$*"
}

fail() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

TARGET=""
RUNTIMES="both"
PRESET="all-principles"
MODE="symlink"
FORCE=0
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || fail "--target requires a value"
      TARGET="$2"
      shift 2
      ;;
    --runtimes)
      [[ $# -ge 2 ]] || fail "--runtimes requires a value"
      RUNTIMES="$2"
      shift 2
      ;;
    --preset)
      [[ $# -ge 2 ]] || fail "--preset requires a value"
      PRESET="$2"
      shift 2
      ;;
    --mode)
      [[ $# -ge 2 ]] || fail "--mode requires a value"
      MODE="$2"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      fail "unknown argument: $1"
      ;;
  esac
done

[[ -n "$TARGET" ]] || fail "--target is required"

case "$MODE" in
  copy|symlink) ;;
  *) fail "--mode must be copy or symlink" ;;
esac

case "$PRESET" in
  all-principles|minimal|quality-and-security|llm-systems|none) ;;
  *) fail "--preset must be all-principles, minimal, quality-and-security, llm-systems, or none" ;;
esac

case "$RUNTIMES" in
  both)
    INSTALL_CODEX=1
    INSTALL_CLAUDE=1
    ;;
  none)
    INSTALL_CODEX=0
    INSTALL_CLAUDE=0
    ;;
  *)
    INSTALL_CODEX=0
    INSTALL_CLAUDE=0
    IFS=',' read -r -a runtime_parts <<<"$RUNTIMES"
    for runtime in "${runtime_parts[@]}"; do
      case "$runtime" in
        codex) INSTALL_CODEX=1 ;;
        claude) INSTALL_CLAUDE=1 ;;
        *) fail "unsupported runtime: $runtime" ;;
      esac
    done
    ;;
esac

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(cd "$TARGET" && pwd)"

[[ -d "$TARGET" ]] || fail "target is not a directory: $TARGET"

COMMON_ITEMS=(
  "skills"
  "agent-workflows"
  "docs"
  "plans"
  "review.presets"
  "review.local.md.example"
)

install_file() {
  local src="$1"
  local dst="$2"
  local display_src="$3"

  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ $FORCE -ne 1 ]]; then
      fail "destination already exists: $dst (use --force to overwrite)"
    fi
    if [[ $DRY_RUN -eq 1 ]]; then
      log "remove $dst"
    else
      rm -rf "$dst"
    fi
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    log "$MODE $display_src -> $dst"
    return
  fi

  mkdir -p "$(dirname "$dst")"
  if [[ "$MODE" == "symlink" ]]; then
    ln -s "$src" "$dst"
  else
    cp "$src" "$dst"
  fi
}

install_path() {
  local src_rel="$1"
  local src_root="$PACKAGE_ROOT/$src_rel"

  [[ -e "$src_root" ]] || fail "missing source path: $src_root"

  if [[ -f "$src_root" ]]; then
    install_file "$src_root" "$TARGET/$src_rel" "$src_rel"
    return
  fi

  while IFS= read -r src_file; do
    local rel="${src_file#$PACKAGE_ROOT/}"
    install_file "$src_file" "$TARGET/$rel" "$rel"
  done < <(find "$src_root" -type f | sort)
}

install_preset() {
  [[ "$PRESET" != "none" ]] || return

  local src="$PACKAGE_ROOT/review.presets/$PRESET.md"
  local dst="$TARGET/review.local.md"

  [[ -f "$src" ]] || fail "missing preset file: $src"

  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ $FORCE -ne 1 ]]; then
      fail "destination already exists: $dst (use --force to overwrite)"
    fi
    if [[ $DRY_RUN -eq 1 ]]; then
      log "remove $dst"
    else
      rm -rf "$dst"
    fi
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    log "copy review.presets/$PRESET.md -> $dst"
    return
  fi

  cp "$src" "$dst"
}

log "Installing agent-engineering"
log "  package:  $PACKAGE_ROOT"
log "  target:   $TARGET"
log "  mode:     $MODE"
log "  runtimes: $RUNTIMES"
log "  preset:   $PRESET"

for item in "${COMMON_ITEMS[@]}"; do
  install_path "$item"
done

if [[ $INSTALL_CODEX -eq 1 ]]; then
  install_path ".codex"
fi

if [[ $INSTALL_CLAUDE -eq 1 ]]; then
  install_path ".claude"
fi

install_preset

if [[ $DRY_RUN -eq 1 ]]; then
  log "Dry run complete"
else
  log "Install complete"
fi
