Function Create-CMComputerAssociation
{
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory=$True,HelpMessage="Please enter Site Server")]
            $SiteServer,
        [Parameter(Mandatory=$True,HelpMessage="Please enter Site Server Site Code")]
            $SiteCode,
        [Parameter(Mandatory=$True,HelpMessage="Please enter Source computer name")]     
            $SourceComputer,
        [Parameter(Mandatory=$True,HelpMessage="Please eneter destination computer name")]     
            $DestinationComputer 
         )
    
    
    $Method = "AddAssociation"
    $Class = "SMS_StateMigration"
    $Colon = ":"
    
    Try{
        $SourceMachineQuery = Get-WmiObject -Namespace "Root\SMS\Site_$SiteCode" -Class "SMS_R_SYSTEM" -Filter "Name='$SourceComputer'" -ErrorAction STOP -computerName $SiteServer
    }
    Catch{
        Write-Host "Error: $($_.Exception.Message)"
    }
    
    Try{
        $DestinationMachineQuery = Get-WmiObject -Namespace "Root\SMS\Site_$SiteCode" -Class "SMS_R_SYSTEM" -Filter "Name='$DestinationComputer'" -ErrorAction STOP -computerName $SiteServer

    }
    Catch{
        Write-Host "Error: $($_.Exception.Message)"
    }
    
    If($SourceMachineQuery -eq $Null){
        Write-Host "There is no such computer like $SourceComputer"
    }
    ElseIf($DestinationMachineQuery -eq $Null){
        Write-Host "There is no such computer like $DestinationComputer"
    }
    Else{
        Try{
            $WMIConnection = [WMICLASS]"\\$SiteServer\root\SMS\Site_$SiteCode$Colon$Class"
                $AddAssoc = $WMIConnection.psbase.GetMethodParameters($Method)
                $AddAssoc.SourceClientResourceID = $SourceMachineQuery.ResourceId
                $AddAssoc.RestoreClientResourceID = $DestinationMachineQuery.ResourceId
            $Return = $WMIConnection.psbase.InvokeMethod($Method,$AddAssoc,$null)
        }
        Catch{
            Write-Host "Error: $($_.Exception.Message)"
        }  
          
            If($Return.ReturnValue -eq 0){
                Write-Host "Successfully created computer Association"
            }
            Else{
                Write-Host "Something went wrong"
            }
   }         
}

#Create-CMComputerAssociation -SiteServer localhost -SiteCode c01 -SourceComputer sms07 -DestinationComputer server1