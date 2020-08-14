# simple function that attempts to create an EC2Keypair with the AWS SDK
function CreateEC2KeyPair($KeyName,$Ec2KeyPairBase64,$Region)
    { 
        try
            {
                Import-EC2KeyPair -KeyName $KeyName -PublicKeyMaterial $Ec2KeyPairBase64 -Region $Region
                Write-Output "Import Success"
            }
        catch
            {
                throw "Import-EC2KeyPair gave ERROR"
            }
    }