echo "IBM Message Broker Dev Mode";

$env:path = $env:DefaultPath;
$env:DevEnvironment = "Broker";
Append-Path "${env:ProgramFiles}\IBM\MQSI\8.0.0.0\bin\";
Append-Path "${env:ProgramFiles(x86)}\IBM\WMBT800\bin\";


function Convert-WithXslt($originalXmlFilePath, $xslFilePath, $outputFilePath) 
{
   ## Simplistic error handling
   $xslFilePath = resolve-path $xslFilePath
   if( -not (test-path $xslFilePath) ) { throw "Can't find the XSL file" } 
   $originalXmlFilePath = resolve-path $originalXmlFilePath
   if( -not (test-path $originalXmlFilePath) ) { throw "Can't find the XML file" } 
   
   Add-Type -Path "C:\lib\mvp.xml\Mvp.Xml.dll"

   ## Get an XSL Transform object (try for the new .Net 3.5 version first)
   $EAP = $ErrorActionPreference
   $ErrorActionPreference = "SilentlyContinue"
   $script:xslt = new-object system.xml.xsl.xslcompiledtransform
   trap [System.Management.Automation.PSArgumentException] 
   {  # no 3.5, use the slower 2.0 one
      $ErrorActionPreference = $EAP
      $script:xslt = new-object system.xml.xsl.xsltransform
   }
   $ErrorActionPreference = $EAP
   
   ## load xslt file
   $xslt.load( $xslFilePath )
     
   ## transform 
   $xslt.Transform( $originalXmlFilePath, $outputFilePath )
}