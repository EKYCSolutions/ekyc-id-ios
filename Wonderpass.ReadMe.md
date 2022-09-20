
![ekyc-logo](https://user-images.githubusercontent.com/81238558/175898415-4c0f508f-c2d5-4b3d-afba-f531551520d6.png)

# EkycID REST API Document

This REST API created for	**WONDERPASS**  only. If you need more support about our OCR Service, kindly contact at all the time.

EkycID is:
* Easy to integrate into existing ecosystems and solutions through the use of SDKs that supported both native and hybrid applications.
* Better for user experience being that the document detections and liveness checks are done directly offline on the device.
* Great for cutting down operations cost and increasing efficiency by decreasing reliance on human labor and time needed for manual data entry. 


EkycID can:
* Extract information from identity documents through document recognition & OCR.
* Verify whether an individual is real or fake through liveness detection, and face recognition. 
* Verify the authenticity of the identity documents by combining the power of document detection, OCR, liveness detection, and face recognition. 

# 1. Requirements

- ID card image file for both main side and secondary side (**raw file from camera without any crop**).
- Image size less than 24 megabyte.

# 2. Route and Parameter

**Route:** Add the following route for OCR request.
```route
 https://wonderpass-ekyc.demo.ekycsolutions.com/ocr
```

**Method:** 

``
POST
``

**Parameters:** 
```javascript
# add this as param body, and here the sample locate:
{
  'mainSide': @/Users/xanonx/Desktop/abce.jpeg,
  'secondarySide': @/Users/xanonx/Desktop/abce.jpeg
}
```

# 3. Response

## 3.1. Success Response

```javascript
{
    "message": "success",
    "successCode": "200",
    "data": {
        "age": 32,
        "dateOfBirth": "1990-08-03T00:00:00.000Z",
        "gender": "M",
        "address": "ផ្ទុះ៣៣ ផ្លូវ៣៥៥ ភូមិ១ ផ្ទុះ៣៣ ផ្លូវ៣៥៥ ភូមិ១",
        "lastName": "POV",
        "firstName": "SREY",
        "idCardNumber": "343234587",
        "expireDate": "2026-01-25T00:00:00.000Z"
    }
}
```

## 3.2. Error Response

```javascript
{
    "message": "invalid national id",
    "successCode": "422",
    "data": {}
}
```

# 4. Contact
<p>For any other questions, feel free to contact us at 
  <a href="https://ekycsolutions.com/">ekycsolutions.com</a>
</p>

# 5. License
© 2022 EKYC Solutions Co, Ltd. All rights reserved.
