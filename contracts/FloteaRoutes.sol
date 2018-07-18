pragma solidity ^0.4.24;

import "FloteaRoles.sol";

/// Based on GTFS standard
contract FloteaRoutes is FloteaRoles {
    // FunBus,The Fun Bus,http://www.thefunbus.org,America/Los_Angeles,(310) 555-0222,en
    struct Agency {
        uint16 agencyId; //~65k
        bytes2 agencyName;
        string agencyUrl;
        bytes32 agencyTimezone;
    }
    
    //S1,Mission St. & Silver Ave.,The stop is located at the southwest corner of the intersection.,37.728631,-122.431282,,,
    struct Stop {
        bytes4 stopId; //A1 - ZZ99
        bytes32 stopName;
        bytes10 stopLat; //cheaper than int32
        bytes10 stopLon;
    }
    
    //A,17,Mission,"The ""A"," route travels from lower Mission to Downtown.",3
    struct Route {
        bytes4 routeId;
        uint16 agencyId;
        bytes16 routeShortName;
        bytes32 routeLongName;
        uint8 routeType; //cheaper than bytes2    
    }
    
    //A,WE,AWE1
    struct Trip {
        bytes2 routeId;
        bytes2 serviceId;
        bytes6 tripId; //could be longer: i.e ABWE10
    }
    
    // AWE1,06:10,06:10,S1,1
    struct StopTime {
        bytes6 tripId;
        bytes5 arrivalTime; // "06:15"
        bytes5 departureTime;
        bytes4 stopId;
        uint8 stopSequence;
    }

    // WE,0,0,0,0,0,1,1,20060701,20060731
    struct Calendar {
        bytes2 serviceId;
        bool monday; //reading cost ~500
        bool tuesday;
        bool wednesday;
        bool thursday;
        bool friday;
        bool saturday;
        bool sunday;
        bytes6 start_date; //YYMMDD
        bytes6 end_date; //YYMMDD  
    }
    
    // WD,20060703,2
    struct CalendarDates {
        bytes2 serviceId;
        bytes6 date;
        uint8 exception_type; // could be bool but uint is cheaper
    }
    
    // 1,1000,USD,0,0  
    struct FareAttributes {
        uint32 fareId;
        uint24 price; //with decimals so 10 USD is stored as 1000
        bytes4 currency_type;
        uint8 payment_method;
        uint8 transfers; 
    }
    
    // a,TSW,1,1,   
    struct FareRules {
        uint32 fareId;
        bytes4 routeId;
    }
    
    Agency[] public agencies;
    Stop[] public stops;
    Route[] public routes;
    Trip[] public trips;
    
    function addAgency(
        uint16 _agencyId,
        bytes2 _agencyName,
        string _agencyUrl,
        bytes32 _agencyTimezone
    ) public onlyManager {
        agencies.push(Agency(_agencyId, _agencyName, _agencyUrl, _agencyTimezone));    
    }
    
    function addStop(
        bytes4 _id,
        bytes32 _name, 
        bytes10 _latitude, 
        bytes10 _longitude
    ) public onlyManager {
        stops.push(Stop(_id, _name, _latitude, _longitude));    
    }
    
    function addRoute(
        bytes4 _routeId,
        uint16 _agencyId,
        bytes16 _routeShortName,
        bytes32 _routeLongName,
        uint8 _routeType 
    ) public onlyManager {
        routes.push(
            Route(
                _routeId, 
                _agencyId, 
                _routeShortName, 
                _routeLongName, 
                _routeType
                )
            );    
    }
    
    function addTrip(
        bytes2 _routeId,
        bytes2 _serviceId,
        bytes6 _tripId
    ) public onlyManager {
        trips.push(Trip(_routeId, _serviceId, _tripId));    
    }
}