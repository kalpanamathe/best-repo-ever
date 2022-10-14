Public class Employee {
   String EmployeeName;
   Integer EmployeeNo;
   
  Public Employee() 
  {
       BankExample23 be=new BankExample23();
  double d=be.Withdraw(9000);
         system.debug('d is' +d);
    EmployeeName = 'Ajinkya';
    EmployeeNo = 10;
     // show();
   }
 public void show() 
 {
   System.debug('Employee Name is '+ EmployeeName);
   System.debug('Employee No is '+ EmployeeNo);
  }
    public void collectionList()
    {
   		List<String> listm1=new list<string>();
        List<String> listm2=new list<string>();
        set<string> setm1=new set<string>();
        set<string> setm2=new set<string>();   
        map<Integer,String> mapm1=new map<Integer,String>();
        map<Integer,String> mapm2=new map<Integer,String>();
        
        listm2.add('Ben');
        listm2.add('tim');
        listm2.add('kim');
        system.debug('List2 Elements:' +listm2);
        listm1.add('123');
        listm1.add('456');
        listm1.add('abc');
        listm1.add('xyz');
        listm1.add('cba');
        listm1.add('zyx');
        listm1.add('efg');
        listm1.add(3,'lmn');
         system.debug('List1 Elements:' +listm1);
        listm1.addall(listm2);
        system.debug('List1 Elements + List2 Elements:' +listm1);
        listm1.addAll(setm1);
        system.debug(':' +listm1);
        
        system.debug('List1 Contains:' +listm1.contains('abc'));
        system.debug('List1 Equals to :' +listm1.equals(listm2));
        system.debug('List1 After get:' +listm1.get(2));  
        system.debug('List1 index value:' +listm1.indexof('abc')); 
       system.debug('List1 isempty:' +listm1.isEmpty());    
        system.debug('List1 iterator:' +listm1.iterator()); 
        system.debug('List1 after Remove:' +listm1.remove(1)); 
        listm1.set(1,'Zen');
        system.debug('List1 set:' +listm1); 
        system.debug('List1 after Size:' +listm1.size()); 
        listm1.sort();
        system.debug('List1 after Sort:' + listm1); 
        system.debug('List1 tostring:' +listm1.tostring()); 
        system.debug('List1 Elements after clone:' +listm1.clone());
     //   listm1.clear();
       // system.debug('List1 Elements after Clear:' +listm1);
        
        //-------------------------------------------
        
        setm1.add('set1');
        setm1.add('set2');
        setm1.add('set3');
        setm1.add('set4');
        system.debug('set1 elements'+setm1);
        setm2.add('setm21');
         setm2.add('setm22');
        setm1.addAll(setm2);
        system.debug('set1 elements +set2 elements'+setm1);
        setm1.addAll(listm1);
        system.debug('set1 elements with list elements'+setm1);
         
        setm1.clone();
        system.debug('set1 after Clone' +setm1);
        system.debug('set1 contains or not : ' +setm1.contains('set1'));
        system.debug('set1 containsall or not: ' +setm1.containsAll(listm1));
        system.debug('set1 contains or not ' +setm1.equals(setm2));
        system.debug('set1 Empty or not' +setm1.isEmpty());
        setm1.retainAll(setm2);
        system.debug('Set1 elements reatining: ' +setm1);
        setm1.retainAll(listm1);
        system.debug('List  elements reatining: ' +setm1);
        system.debug('Set1  elements Size: ' +setm1.size());
        setm1.Remove('set1');
		system.debug('set1 Remove specified set  Element' +setm1);  
        setm1.RemoveAll(setm1);
        system.debug('set1 Remove All set Elements' +setm1);  
        setm1.RemoveAll(listm1);
        system.debug('set1 Remove All List Elements' +setm1);  
        system.debug('set1 contains or not' +setm1.contains('set1'));
        setm1.clear();
         system.debug('set1 after clear' +setm1);
        
        //-------------------------
        //mapm1.put(101,'map1');
        mapm1.put(102,'map2');
        mapm1.put(103,'map3');
        mapm1.put(104,'map4');
        mapm1.put(105,'map5');
        
        mapm2.put(101,'map11');
        mapm2.put(102,'map22');
        mapm2.put(103,'map3');
        
        system.debug('map1 elements: ' +mapm1);
        system.debug('map2 elements: ' +mapm2);
        
        system.debug('map elements Contains or not  : ' +mapm1.containsKey(103));
        system.debug('Equal or not : ' +mapm1.equals(mapm2));
        system.debug('map by using get  : ' +mapm1.get(102));
        system.debug('map is empty or not  : ' +mapm1.isempty());
        system.debug('map1 key set elements  : ' +mapm1.Keyset());
        mapm1.putAll(mapm2);
        system.debug('put all map1 elements  : ' +mapm1);
        mapm1.remove(103);
        system.debug('map1 elements after remove : ' +mapm1);
        system.debug('map1 size : ' +mapm1.size());
        system.debug('map1 Values : ' +mapm1.values());
        mapm1.clone();
        system.debug('map elements after clone : ' +mapm1);
         mapm1.clear();
        system.debug('map elements after Clear : ' +mapm1);
        
    }
    
 }