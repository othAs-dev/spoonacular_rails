# Rails X Spoonacular

### Description
This project uses **Rails 8.0.1** with **MongoDB** and makes HTTP requests with **httparty** to the Spoonacular API
(see the documentation [here](https://spoonacular.com/food-api/docs) to retrieve recipes and their ingredients,
which are then stored in the database and displayed in the browser

It also uses **TailwindCSS** for layout and styling.


## Application Workflow
#### Project Initialization :
After cloning this project and installing the dependencies,
a **Rake task** is executed to retrieve recipes and their ingredients from the Spoonacular API
and save them to the database

### Data Retrieval and Display:

Once the data is stored in the database, it is retrieved and displayed.


### Recipe Editing :
It is possible to edit recipes via the application's interface.

### Recipe Deletion :
It is also possible to delete recipes via the application's interface.

### Installation and Running the Project

To clone the project and access it, run the following commands:
> run `git clone https://github.com/othAs-dev/spoonacular_rails.git`

> run `cd spoonacular_rails`

To install the dependencies, run the following command:

> run `bundle install`

To launch the application, run the following command:

> run `bin/dev`

This command starts the application and runs the **Rake task** to fetch data from the API and store it in the database.


## Notes

Remember to configure your **Spoonacular API key** in the `.env` file.

*Refer to the `.env.example` file for more details*.

