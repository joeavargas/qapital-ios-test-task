//
//  Documentation.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/27/22.
//

/*
 
--- Remarks ---
 
* User API Endpoint had not valid images
 - I was able to query the endpoint but there were no images hosted for KingFisher parse and present
 
* Unable to render HTML string
 - Unable to render HTML string even after applying methods like this: https://stackoverflow.com/a/59699263/12773302
 - After a few attempts with the solution above, I noticed the ActivityFeedCardView broke.
 - I wanted to find a third party dependency to help resolve
 
* Additional time needed to research formatting dates and compare each object
 - I would have started by making the Activities model object conform to the Comparable protocol to compare each parsed object in order to group them in a 2-week range.
 
*/
