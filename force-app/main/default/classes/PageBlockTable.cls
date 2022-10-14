public class PageBlockTable {
    public static list<account> lstacc{get;set;}
    public boolean nextDisable{get;set;}
    public boolean PreviousDisable{get;set;}
    public integer offsetval{get;set;}
    public integer totalRecords{get;set;}
    public PageBlockTable()
    {
        lstacc=new list<account>();
        lstacc=[select id,name,Industry from Account limit 10 offset 0];
        list<account> lstsize=[select id from Account];
        if(lstsize.size()>10)
        {
            totalRecords=lstsize.size();
            nextDisable=false;
        }
        else
        {
            nextDisable=true;
        }PreviousDisable=true;
        offsetval=0;
    }
    public void Previous()
    {
        offsetval=offsetval-10;
         lstacc=[select id,name,Industry from Account limit 10 offset : offsetval];
        nextDisable=false;
        if(offsetval<=10)
        {
            previousDisable=true;
        }else
        {
            previousDisable=false;
        }
        
    }
    public void Next()
    {
        offsetval=offsetval+10;
         lstacc=[select id,name,Industry from Account limit 10 offset : offsetval];
        if(totalRecords<=offsetval+10)
        {
            nextDisable=true;
        }else
        {
            nextDisable=false;
        }
        previousDisable=false;
    }
}