#/bin/sh

read -r -d '' STYLE << EOF
{
    Language: Cpp,
    BasedOnStyle: Google,

    DerivePointerAlignment: false,
    PointerAlignment: Left,

    BreakBeforeBraces: Allman,

    AlignOperands: true,
    AlignAfterOpenBracket: Align,

    AccessModifierOffset: -4,

    Cpp11BracedListStyle: true,
    NamespaceIndentation: None,
    UseTab: Never,
    TabWidth: 4,
    Standard: Cpp11,
    SpaceBeforeParens: ControlStatements,
    AlwaysBreakTemplateDeclarations: true,

    BinPackArguments: false,
    BinPackParameters: false,

    AlignAfterOpenBracket: true,
    AlignConsecutiveAssignments: true,
    IndentWidth: 4,
    ColumnLimit: 120,
    AllowShortFunctionsOnASingleLine: Inline,
    AllowShortBlocksOnASingleLine: false,

    BreakConstructorInitializersBeforeComma: true,
    BreakBeforeBinaryOperators: NonAssignment,
    BreakBeforeTernaryOperators: true,

    BreakStringLiterals: false,

    SortIncludes: true,
}
EOF

clang-format -style="$STYLE" "$@"

exit $?
