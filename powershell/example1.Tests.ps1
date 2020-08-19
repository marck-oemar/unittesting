Describe 'Testing Func1' {
    BeforeAll {
        . $PSCommandPath.Replace('.Tests.ps1','.ps1')
    }

    It 'outputs a string' {
        Func1 | Should -Be "Func1 is working!"
    }

    It 'outputs an unexpected string' {
        Func1 | Should -Be "Func1 is workinggg!"
    }
}