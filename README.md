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

User sees a home page that displays teams.
User views a team's players on the team home page with the ability to select a player.
User adds a new team by adding a new player.
User can search for a player from a team.
User deletes a player from a team.
User updates a players statistics. 

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
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]