BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1','.ps1')
}

describe 'Func1' {
    It 'outputs a string' {
        Func1 | Should -Be "Func1 is working!"
    }
}