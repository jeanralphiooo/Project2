public class tolkienRequest {
    public static void getTolkienRequest() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://the-one-api.herokuapp.com/v1/book');

        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if(response.getStatusCode()== 200){


            Map<String,Object> respList = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> objectList = (List<Object>) respList.get('docs');
            List<Map<String, Object>> mapList = new List<Map<String, Object>>();
            Map<String, Object> stringToMap = new Map<String, Object>();
            
            for(object ob : objectList){
                stringToMap = (Map<String, Object>) ob;
                mapList.add(stringToMap);
                
            }
                      
         List<Book__c> bookList = new List<Book__c>();
            
         for(Map<String, Object> b : mapList){
              
             Book__c aBook = new Book__c();
                 
             	
          //  aBook.Title__c = b.get('name');
            
             bookList.add(aBook);
            
                              
            }
            
            
            
            
                
            }
            
                      // system.debug(objectList);
           // Book__c book1 = new Book__c();

            //book1.Title__c = (String) respList.get('name');
            
            //System.debug(book1);

          //  insert book1;
        }

        
        //else if(response.getStatusCode() != 200){
            
        //    system.debug(response.getStatusCode());
       // }


    }

//web key IWhPlSxj76_OzQhxMkMZ