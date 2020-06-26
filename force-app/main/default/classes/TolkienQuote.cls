public class TolkienQuote {
    public static void getTolkienQuote() {
        
       String identifier = '5cd99d4bde30eff6ebccfd0d';
        
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
              
                }
            }
           }