# EmployeeDirectoryApi
This is the API for the employee directory project in its own Swift Package Manager compliant package.

## Build tools & versions used
- swift-tools-version 5.5, the latest for Swift Package Manager as of writing.
- iOS 15 to be able to make use of some of the newest stuff

## Steps to run the app
The only thing you can really do here is run the tests.  If you don't want to run them through Xcode, you can see their last execution with my last push to GitHub triggered by GitHub Actions
## What areas of the app did you focus on?
I focused on making an extensible API that could easily have dozens of endpoints added to it without things getting disorganized or hard to test.  I also wanted to make it as user-friendly for the client app as possible.  This is why the `invoke` method is an instance method on the endpoint being called and the endpoints use generics and async/await to allow their response types to be `invoke`'s return type without too much hassle.  That's also the reason I made use of an Endpoint protocol that was conformed to with an enum.  I find that this helps to add some guard rails when adding a new endpoint to the API.  It also makes it harder to add a bad endpoint, since the compiler will complain with errors if anything is missing.
## What was the reason for your focus? What problems were you trying to solve?
I focused on extensibility and user-friendliness from the consuming client's perspective because I think those are some of the most important features an API should have.  Extensibility is particularly important, because any developing API will continuously have new endpoints added to it.  My goal was to make adding new endpoints and maintaining existing ones as easy as possible.
## How long did you spend on this project?
About 2 hours for the API
## Did you make any trade-offs for this project? What would you have done differently with more time?
I didn't consider more complicated endpoints, such as ones that need path params or query params.  If I had more time, I would have implemented those.
## What do you think is the weakest part of your project?
I think the weakest part of the API is that it doesn't consider path params or query params.  If it were to be used in a production setting, it really needs those.
## Did you copy any code or dependencies? Please make sure to attribute them here!
None of the code is copied from elsewhere.  I did use Apple's SDK documentation to help with some syntax.  I did some minor Googling to help me to recall how to access JSON fixtures from a package, specifically remembering to use `Bundle.module` instead of `Bundle.main` to find the JSON file.
## Is there any other information you’d like us to know?
Nothing that hasn't been covered elsewhere
