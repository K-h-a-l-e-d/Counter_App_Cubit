# Counter App using Cubits

## Description
This is a Simple flutter Counter application with bloc(Cubit) state management

## Features
- toggling between Light & Dark themes using a switch widget
- displaying the current value of the counter & updating it in case of increment/decrement functions triggering
- triggering a snackbar message, and dialog if the counter value reached 10 or -10 or negative values 

## code explanation

the code flow is done as the following:-  
counter part:  
 1- the counter value displayed is obtained from the provided counter bloc state (initially  set as 0)  
 2- on pressing the increment/decrement floating action button a function (incrementCounter/decrementCounter (provided by blocProvider) ) is triggered which emits the State Class that 
    increments then updates the current state count value which in turn is updated at the ui by the builder  
 3- when the counter value reaches 10 or -10  a state is emitted which can be used inside the listener in the counter ui to display a snackbar message,
 also when the counter value reaches -1 (e.g. the beginning or negative numbers) it triggers a dialog message

Themes part:  
 1- the ThemeState is provided to the theme property in material app in main page and its set initially as dark theme, when the switch button is toggled (toggleDarkTheme) function is 
    triggered which emits a state that checks whether 
    the current theme is dark or light then it updates the state with the opposite theme

  


## Application Screenshots: 
|![s1](https://github.com/user-attachments/assets/c3773dd2-8c4c-4355-9217-94af437f522b)|![s2](https://github.com/user-attachments/assets/b9c59750-0905-40e9-a542-e3e5d8b2f46b)|![s3](https://github.com/user-attachments/assets/067576c4-7195-4a5c-ad4a-8ae9c01ed2a3)|
|-|-|-|
