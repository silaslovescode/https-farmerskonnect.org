// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    // Struct to store land details
    struct Land {
        address currentUser;
        string title;
        string landType;
        string soilType;
        string country;
        uint256 price;
        string details;
        uint256 timestamp;
        bool exists;
    }

    // Struct to store image details
    struct Image {
        address uploader;
        uint256 landId;
        string downloadURL;
        uint256 timestamp;
    }

    // Struct to store booking details
    struct Booking {
        address booker;
        address owner;
        uint256 landId;
        uint256 price;
        string message;
        uint256 timestamp;
    }

    // Mapping from land ID to Land struct
    mapping(uint256 => Land) public lands;
    // Mapping from image ID to Image struct
    mapping(uint256 => Image) public images;
    // Mapping from booking ID to Booking struct
    mapping(uint256 => Booking) public bookings;

    // Land ID and Booking ID counters
    uint256 public landIdCounter = 1;
    uint256 public imageIdCounter = 1;
    uint256 public bookingIdCounter = 1;

    // Subscribe with email
    mapping(address => string) public emailSubscriptions;

    // Event declarations
    event LandPosted(uint256 landId, address indexed currentUser);
    event ImagePosted(uint256 imageId, address indexed uploader);
    event LandBooked(uint256 bookingId, address indexed booker);
    event EmailSubscribed(address indexed user, string email);

    // Function to post a land
    function postLand(
        string memory _title,
        string memory _landType,
        string memory _soilType,
        string memory _country,
        uint256 _price,
        string memory _details
    ) public {
        uint256 landId = landIdCounter++;
        lands[landId] = Land({
            currentUser: msg.sender,
            title: _title,
            landType: _landType,
            soilType: _soilType,
            country: _country,
            price: _price,
            details: _details,
            timestamp: block.timestamp,
            exists: true
        });
        emit LandPosted(landId, msg.sender);
    }

    // Function to post an image
    function postImage(uint256 _landId, string memory _downloadURL) public {
        require(lands[_landId].exists, "Land does not exist");
        uint256 imageId = imageIdCounter++;
        images[imageId] = Image({
            uploader: msg.sender,
            landId: _landId,
            downloadURL: _downloadURL,
            timestamp: block.timestamp
        });
        emit ImagePosted(imageId, msg.sender);
    }

    // Function to book a land
    function bookLand(
        uint256 _landId,
        address _owner,
        uint256 _price,
        string memory _message
    ) public {
        require(lands[_landId].exists, "Land does not exist");
        uint256 bookingId = bookingIdCounter++;
        bookings[bookingId] = Booking({
            booker: msg.sender,
            owner: _owner,
            landId: _landId,
            price: _price,
            message: _message,
            timestamp: block.timestamp
        });
        emit LandBooked(bookingId, msg.sender);
    }

    // Function to subscribe with email
    function subscribe(string memory _email) public {
        emailSubscriptions[msg.sender] = _email;
        emit EmailSubscribed(msg.sender, _email);
    }

    // Function to get land details
    function getLand(uint256 _landId) public view returns (Land memory) {
        require(lands[_landId].exists, "Land does not exist");
        return lands[_landId];
    }

    // Function to get image details
    function getImage(uint256 _imageId) public view returns (Image memory) {
        return images[_imageId];
    }

    // Function to get booking details
    function getBooking(uint256 _bookingId) public view returns (Booking memory) {
        return bookings[_bookingId];
    }

    // Function to get email subscription
    function getSubscription() public view returns (string memory) {
        return emailSubscriptions[msg.sender];
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LandRegistry {
    // Struct to store land details
    struct Land {
        address currentUser;
        string title;
        string landType;
        string soilType;
        string country;
        uint256 price;
        string details;
        uint256 timestamp;
        bool exists;
    }

    // Struct to store image details
    struct Image {
        address uploader;
        uint256 landId;
        string downloadURL;
        uint256 timestamp;
    }

    // Struct to store booking details
    struct Booking {
        address booker;
        address owner;
        uint256 landId;
        uint256 price;
        string message;
        uint256 timestamp;
    }

    // Mapping from land ID to Land struct
    mapping(uint256 => Land) public lands;
    // Mapping from image ID to Image struct
    mapping(uint256 => Image) public images;
    // Mapping from booking ID to Booking struct
    mapping(uint256 => Booking) public bookings;

    // Land ID and Booking ID counters
    uint256 public landIdCounter = 1;
    uint256 public imageIdCounter = 1;
    uint256 public bookingIdCounter = 1;

    // Subscribe with email
    mapping(address => string) public emailSubscriptions;

    // Event declarations
    event LandPosted(uint256 landId, address indexed currentUser);
    event ImagePosted(uint256 imageId, address indexed uploader);
    event LandBooked(uint256 bookingId, address indexed booker);
    event EmailSubscribed(address indexed user, string email);

    // Function to post a land
    function postLand(
        string memory _title,
        string memory _landType,
        string memory _soilType,
        string memory _country,
        uint256 _price,
        string memory _details
    ) public {
        uint256 landId = landIdCounter++;
        lands[landId] = Land({
            currentUser: msg.sender,
            title: _title,
            landType: _landType,
            soilType: _soilType,
            country: _country,
            price: _price,
            details: _details,
            timestamp: block.timestamp,
            exists: true
        });
        emit LandPosted(landId, msg.sender);
    }

    // Function to post an image
    function postImage(uint256 _landId, string memory _downloadURL) public {
        require(lands[_landId].exists, "Land does not exist");
        uint256 imageId = imageIdCounter++;
        images[imageId] = Image({
            uploader: msg.sender,
            landId: _landId,
            downloadURL: _downloadURL,
            timestamp: block.timestamp
        });
        emit ImagePosted(imageId, msg.sender);
    }

    // Function to book a land
    function bookLand(
        uint256 _landId,
        address _owner,
        uint256 _price,
        string memory _message
    ) public {
        require(lands[_landId].exists, "Land does not exist");
        uint256 bookingId = bookingIdCounter++;
        bookings[bookingId] = Booking({
            booker: msg.sender,
            owner: _owner,
            landId: _landId,
            price: _price,
            message: _message,
            timestamp: block.timestamp
        });
        emit LandBooked(bookingId, msg.sender);
    }

    // Function to subscribe with email
    function subscribe(string memory _email) public {
        emailSubscriptions[msg.sender] = _email;
        emit EmailSubscribed(msg.sender, _email);
    }

    // Function to get land details
    function getLand(uint256 _landId) public view returns (Land memory) {
        require(lands[_landId].exists, "Land does not exist");
        return lands[_landId];
    }

    // Function to get image details
    function getImage(uint256 _imageId) public view returns (Image memory) {
        return images[_imageId];
    }

    // Function to get booking details
    function getBooking(uint256 _bookingId) public view returns (Booking memory) {
        return bookings[_bookingId];
    }

    // Function to get email subscription
    function getSubscription() public view returns (string memory) {
        return emailSubscriptions[msg.sender];
    }
}
