public with sharing class searchCharacterController{
    
    @auraEnabled
    public static sObject getCharacter(String search){
        //String search = 'Gimli';
        List<sObject> returnList = new List<sObject>();
        List<Character__c> listOfChar = [SELECT Name, CharacterIdentifier__c FROM Character__c WHERE Name = :search];
        
        system.debug(listOfChar);
        
        for(Character__c chara : listOfChar){
            returnList.add(chara);
        }
        
        Character__c charact = new Character__c();
        
        charact=listOfChar.get(0);
        
        string identifier = charact.CharacterIdentifier__c;
        Favorite__c fav = new Favorite__c();
        
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://the-one-api.herokuapp.com/v1/character/' + identifier + '/quote');
        request.setHeader('Authorization', 'Bearer IWhPlSxj76_OzQhxMkMZ');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode()== 200){
            system.debug('it worked');
            Map<String, Object> respList = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //System.debug(respList);
            List<Object> objectList = (List<Object>)respList.get('docs');
            List<Map<String,Object>> mapToList = new List<Map<String, Object>>();

            List<Quotes__c> qteList = new List<Quotes__c>();
                                    
            for(Object iterate : objectList){
                
                Map<String, Object> stringToMap = new Map<String,Object>() ;
              
                stringToMap = (Map<STring, Object>) iterate;
                
               Quotes__c qt = new Quotes__c();

               
                qt.QuoteLine__c = (String) stringToMap.get('dialog');
            	qt.CharacterIdentifier__c = (String) stringToMap.get('character'); 
                
                
                
                qteList.add(qt);
            }
            integer rand = Integer.valueOf((Math.random())*100);
            System.debug(qteList[rand]);
            
            
            Quotes__c randQt = new Quotes__c();
            randQt = qteList[rand];
            insert randQt;
            String theQuote = randQt.QuoteLine__c;
           
            
            fav.Name = theQuote;
            fav.favquote__c = theQuote;
            fav.FavoriteChar__c = search;
            system.debug(fav);
            
            system.debug(fav.favquote__c);
            
            //System.debug(randQt.QuoteLine__c);
              returnList.add(fav);
                }
        
        return fav;
            }

    @auraEnabled
    public static void saveQuote(Favorite__c favQuo){
        
        insert favQuo;

        
    }
    }