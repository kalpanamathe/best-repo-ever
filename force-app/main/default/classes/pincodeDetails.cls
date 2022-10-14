public class pincodeDetails
{
    public void getPostalcodeInfo(string pinnumber)
    {
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        Request.setMethod('GET');
        string url='https://api.postalpincode.in/pincode/'+pinnumber;
        Request.setEndpoint(url);
        request.setHeader('Content-type', 'application/json');
        HttpResponse response=p.send(request);
        string jsonresult=response.getBody();
        system.debug('jsonresult:'  +jsonresult);
        List<JSON2Apex> pindetails=(List<JSON2Apex>)JSON.deserialize(jsonresult,  List<JSON2Apex>.class);
         system.debug('pindetails:'  +pindetails);
        for(JSON2Apex  js:pindetails)
        {
            for(JSON2Apex.PostOffice pd:js.PostOffice)
            {
                 system.debug('Name:'  +pd.Name);
                system.debug('District:'  +pd.District);
                system.debug('Division:'  +pd.Division);
                system.debug('Region:'  +pd.Region);
            }
        }
    }
}