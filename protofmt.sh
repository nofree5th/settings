#/bin/sh
#
STYLE=$(cat << EOF
{
    Language: Proto,
    BasedOnStyle: Google,
    BreakBeforeBraces: Attach,
    AlignOperands: true,
    Cpp11BracedListStyle: true,
    NamespaceIndentation: None,
    UseTab: Never,
    TabWidth: 4,
    PointerAlignment: Left,
    SpaceBeforeParens: ControlStatements,
    AlwaysBreakTemplateDeclarations: true,

    BinPackArguments: false,
    BinPackParameters: false,

    AlignAfterOpenBracket: true,
    AlignConsecutiveAssignments: true,

    IndentWidth: 4,
    ColumnLimit: 200,

    AllowShortFunctionsOnASingleLine: Empty,
    AllowShortBlocksOnASingleLine: false,

    BreakBeforeTernaryOperators: true,
}
EOF
)

clang-format -style="$STYLE" "$@"

exit $?
