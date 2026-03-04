declare -A runmap=(
  [py]="python3"  [c]="gcc"       [cpp]="g++"
  [java]="javac"  [d]="dmd"       [go]="go run"
  [js]="node"     [ts]="ts-node"  [rb]="ruby"
  [rs]="rustc"    [kt]="kotlinc"  [swift]="swift"
  [php]="php"     [sh]="bash"     [pl]="perl"
  [lua]="lua"
)

auto_select_file() {
    if [[ -n "$file" ]]; then return; fi
    shopt -s nullglob
    local candidates=()
    for ext in "${!runmap[@]}"; do
        local files=( *."$ext" )
        if [[ ${#files[@]} -eq 1 ]]; then
            candidates+=("${files[0]}")
        fi
    done
}