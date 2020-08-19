Describe 'Test function CreateEC2KeyPair' {
    # setup tests        
    BeforeAll {
        # dot source our sourcecode
        . $PSCommandPath.Replace('.Tests.ps1','.ps1') 
        # create dummy cmdlet because we did not import the actual AWS SDK module. Mock excepts this cmdlet to exist
        function Import-EC2KeyPair { Write-Output "Import-EC2KeyPair Dummy cmdlet" }  
    }

    # test try
    It 'should stay in try when AWS SDK Import-EC2KeyPair is succesful' {    
        # the Mock is used to control the test       
        Mock 'Import-EC2KeyPair' {}
        # main assertion
        CreateEC2KeyPair | Should -Be "Import Success"
        # also assert that the Mock is called. If not, then we have risk of unwanted side effect.
        Assert-MockCalled Import-EC2KeyPair
    }

    # test catch
    It 'should catch when AWS SDK Import-EC2KeyPair has error' {           
        # the Mock is used to control the test
        Mock 'Import-EC2KeyPair' { Throw 'I am throwing AWS SDK exception' }
        # main assertion            
        # Input of Throw needs curly brackets 
        { CreateEC2KeyPair } | Should -Throw 'Import-EC2KeyPair gave ERROR' 
        # also assert that the Mock is called. If not, then we have risk of unwanted side effect.
        Assert-MockCalled Import-EC2KeyPair
    }
}
