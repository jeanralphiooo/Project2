public  class QualityOfLifeLookup {
    public static void getQualityOfLifeLookup() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.teleport.org/api/cities/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){

            System.debug('works');

            Map<String, Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            
            List<Object> cities = (List<Object>) results.get('cities');
            
            System.debug(cities);


            System.debug(results);

        }

        else if(response.getStatusCode() != 200){

            System.debug('nah');
        }
    }
}