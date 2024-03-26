# Pagination Simple Provider

Pagination Simple Provider is a Flutter project that demonstrates how to implement pagination using Provider for state management. This project fetches data from an API (jsonplaceholder.typicode.com) and displays it in a list with pagination support.

## Features
- Fetches data from an API using HTTP requests.
- Implements pagination to load more data as the user scrolls.
- Uses Provider package for state management.

## Prerequisites
- Flutter SDK installed on your machine. You can get it from [here](https://flutter.dev/docs/get-started/install).
- An IDE (such as Android Studio, VSCode) with Flutter support.

## Installation
1. Clone the repository to your local machine:

`git clone https://github.com/your_username/pagination-simple-provider.git`

2. Navigate to the project directory:

`cd pagination-simple-provider`


3. Install dependencies:

`flutter pub get`

4. Run the app:

`flutter run`


## Usage
Once the app is running, you will see a list of posts fetched from the API. Scroll down to load more posts as pagination is implemented. If there are no more posts to load, a message indicating the end of the list will be displayed.

## Project Structure
- **home_page.dart**: Contains the UI implementation for the home page, including the ListView and pagination logic.
- **home_provider.dart**: Defines the Provider class responsible for fetching data and managing state.
- **home_state.dart**: Defines the state enum and state class used by the Provider.
- **main.dart**: Entry point of the application, sets up the Provider and initializes the home page.
- **model.dart**: Defines the data model for a Post.

## Dependencies
- [flutter](https://pub.dev/packages/flutter)
- [provider](https://pub.dev/packages/provider)
- [http](https://pub.dev/packages/http)

## Contributing
Contributions are welcome! If you find any issues or want to add new features, feel free to open a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- Thanks to the Flutter team for providing an amazing framework.
- Thanks to the Provider package contributors for simplifying state management in Flutter.

## Contact
For any inquiries or suggestions, please contact [bensatriya3@gmail.com](mailto:bensatriya3@gmail.com).

---

*This README template is inspired by [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).*
