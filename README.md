# Catching Sabermetrics

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Understanding the physics that take place within baseball poses as a challenge to new baseball fans. Catching Sabermetrics will store and compute imputed baseball statistics to help new baseball fans learn the logistics behind baseball. It includes visual analytics that help translate data into interactive graphs. This software has the potential to be used to manage a multitude of teams such as MLB teams, fantasy teams, and personal coached teams.

### App Evaluation
- **Category:** Sports
- **Mobile:** This application will be developed for mobile use but would be just as viable on a computer. Functionality wouldn’t be limited to mobile devices, however a mobile version would have easier access. 
- **Story:** A user can mange different teams by adding, deleting, and updating players. The user can then view analytics based on their inputted data.
- **Market:** This app can be used by anyone, both new and old baseball fans.
- **Habit:** This app can be used as often or unoften as the user wanted depending on how frequently they update their teams.
- **Scope:** First there will be an introduction to sabermetrics to the user. The users can then manage the players they wish to input statistics for.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] User sees a home page that displays teams.
* [x] User views a team's players on the team home page with the ability to select a player.
* [x] User adds a new team by adding a new player.
* User can search for a player.
* [x] User deletes a player from a team.
* User updates a players statistics. 

**Optional Nice-to-have Stories**

User sorts players on team home page.

### 2. Screen Archetypes
* Home Page - screen to select a team
  * Upon selecting a team opens
* Team page - displays all players with their rank and an option to search for a player.
  * Upon selecting a player opens
* Player page - displays interactive analytics based on inputted player statistics.
* Manage team - screen displaying add, update, and delete options for players.
  * Upon selecting a choice, redirects user to a page to make the changes.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Page
* Team Overview Page
* Manage Teams


**Flow Navigation** (Screen to Screen)

* Home Page
   * Team Overview Page
   * Manage Teams
* Team Overview Page
   * Player Overview page
   * Search for Player
* Manage Teams
   * Update Player
   * Delete Player
   * Add Player

## Wireframes
<img src="https://i.imgur.com/gJMIjx9.jpg" width=800>

### Interactive Prototype
<img src="http://g.recordit.co/wAoWlpgGhP.gif">

## Schema 



### Models
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | createdAt     | DateTime | date when player was added (default field) |
   | updatedAt     | DateTime | date when player was last updated (default field) |
   | firstName     | String   | first name of player |
   | lastName      | String   | last name of player |
   | Team          | String   | team of player |
   | Position      | Number   | position that the player plays |
   | Hits          | Number   | amount of hits made by player |
   | atBats        | Number   | amount of times battling the pitcher |
   | homeRuns      | Number   | amount of home runs made by player |
   | RBI           | Number   | amount of runs batted in |
   | Wins          | Number   | amount of games a pitcher has won|
   | inningsPitched| Number   | amount of innings pitched by pitcher |
   | runsAllowed   | Number   | amount of runs a pitcher has allowed |
   | strikeouts    | Number   | amount of strikeouts |
   
### Networking
* Manage Players
* (Create/POST) Create a new player
* (Delete) Delete existing player
* (Update/PUT) Update player statistics
* Team Overview Screen
* (Read/GET) Displaying Team Players
* Player Overview Screen
* (Read/GET) Displaying Players Stats
