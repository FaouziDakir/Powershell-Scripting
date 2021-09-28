$process = read-host "What process do you ask for ?"

Get-Process $process | Sort-Object ProcessName | format-table processname, ws

$sum = Get-Process $process | Measure-Object ws -sum

$count = (Get-Process $process).Count
echo "$count process are running for $process `n"

$sum = $sum.sum

echo "Total WorkingSet is $sum `n"

function Get-CPU ($process)
{
    $CPUPercent = @{
        Name = 'CPUPercent'
        Expression = {
            $TotalSec = (New-TimeSpan -Start $_.StartTime).TotalSeconds
            [Math]::Round( ($_.CPU * 100 / $TotalSec), 2)
        }
    }
    Get-Process $process | 
    Select-Object -Property Name, $CPUPercent, Description |
    Sort-Object -Property CPUPercent -Descending |
    Measure-Object 'CPUPercent' -sum
}

$percent = Get-CPU($process)
$percent = $percent.sum
echo "Percentage of in-use memory $percent % `n"