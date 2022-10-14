public class youtubevfPage {
 /*   public  string  lsttxt{get;set;}   
    public youtubevfPage(){ }
     public void Search()
    {
    system.debug(lsttxt);
    } }*/
   Public List<string> lsttxt {get;set;}
    public boolean Showlist{get;set;}
    public youtubevfPage() {
        Showlist=false;
        apexpages.StandardController ctl;
    }
     public youtubevfPage(apexpages.StandardController ctl ) {
    }
    public PageReference  Search()
    {
        Showlist=true;
        // lsttxt = lsttxt;
         return null;
      
    }
    
}