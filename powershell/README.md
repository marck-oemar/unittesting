# Unit testing Powershell scripts with Pester

[Pester](https://pester.dev) is the ubiquitous test and mock framework for PowerShell.

Pester provides a framework for running Unit Tests to execute and validate PowerShell commands. Pester follows a file naming convention for naming tests to be discovered by pester at test time and a simple set of functions that expose a Testing DSL for isolating, running, evaluating and reporting the results of PowerShell commands.


## Prepare
We're using a docker container as the testing environment, specifically microsoft/powershell which is a great way to interact with powershell.

Download the image, execute the container and activate Pester 
```
docker run --rm -it -w /code -v "${PWD}:/code" microsoft/powershell
Install-Module Pester -Force
Import-Module Pester 
```

## Tests
There are 2 example Powershell scripts and for each there is a Pseter test file that has certain assertions defined.

Pay attention to example2 which has mocking involved. (https://martinfowler.com/bliki/TestDouble.html)

To execute the tests simply invoke Pester in the container:
```
Invoke-Pester
```
