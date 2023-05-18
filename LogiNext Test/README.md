# LogiNext Assignment

This README details out steps taken to complete the assignemnt. It also entails details about what assumptions were taken in the project

## Setup
```
pod install
```
I am using a library called `SDWebImage` for image loading and rendering, hence pod install is required

## Approach Walk-through
* Storyboard is used for designing the UI.
* The UI Elements created for banner as well as food categories is stackview inside scrollview to create carousel
* A collectionview is used to create the 'offer_collections'. Another collectionview is used to load the restaurants, which has as many sections as 'restaurant_collections' contains.
* The ordering of these sections are based on the 'priority' parameter present in json
* The textcolor & backgroundcolor given in the json is used to create the UI of offers in this collection view
* Wherever 'additional_offer' is present it is shown on the image of the restaurant as a banner

## Design Pattern

* MVVM

## Assumptions & Highlights

* As assets were not provided with the assignment, I've used standard system icons available on XCode
* There is an image (B'Fresh Coffee) which is not loading in the response, this is due to the URL for it being invalid, `h` is missing from its `https` protocol information, if the api is fixed, the image will start appearing automatically