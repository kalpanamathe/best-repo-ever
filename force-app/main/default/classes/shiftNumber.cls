public class shiftNumber 
{
    public static List<Integer> numberShift( List<Integer> inputList,Integer Shiftby)
    {
        integer s=inputlist.size();
        for(integer i=0;i<Shiftby;i++)
        {
            inputlist.add(0,inputlist.get(s-1));
            inputlist.remove(inputlist.size()-1); 
        }
        system.debug(inputlist);
        return inputList;
    }
}