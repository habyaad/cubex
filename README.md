# CubeX
## Country Listing App

### Overview
CubeX is a Flutter-based African country listing mobile application that allows users to view countries and their details. The app provides a clean and user-friendly interface. The project follows clean architecture principles, leveraging Bloc for state management, and implements a repository pattern for data handling.

### Features
-  Country Browsing: View a list of Countries with details like name and capital.
- Country detail viewing: view details of selected country.
- State Management: Efficient state management using Bloc.

### Project Structure
The project is organized using a feature-first approach with a clean architecture setup, ensuring that the app is scalable, maintainable, and easy to navigate. The repository pattern is implemented with dependency injection to handle data operations, making the app's architecture more robust and testable.

### Getting Started

#### Prerequisites
- Flutter SDK installed on your local machine.
- A code editor like VSCode or Android Studio.

#### Setup Instructions

- Clone the repository:

     <code> git clone https://github.com/habyaad/cubex.git </code> <br>
     <code> cd Okrika </code>

-  Install dependencies:
   <code> flutter pub get </code>

- Run the app:
  <code> flutter run </code>


### Design Decisions, Optimizations, and Trade-offs
#### Design Decisions
- Bloc for State Management: Chosen for its scalability, and ease of integration with Flutter's build context. Bloc allows for efficient management of state.
- Clean Architecture: Adopted to ensure separation of concerns, making the app more modular and easier to maintain. The architecture divides the app into distinct layers, such as presentation, domain, and data, each with its own responsibility.
- Repository Pattern: Implemented to manage data operations cleanly and consistently. This pattern abstracts the data source, making it easier to work with different types of remote data sources.

#### Optimizations
- Lazy Loading and Efficient Builds: Careful attention was paid to avoid unnecessary widget rebuilds, leveraging const constructors and selective rebuilding of UI components using Blocbuilder widgets.
- Performance Profiling: The app was profiled using Flutter’s tools to identify and mitigate performance bottlenecks, ensuring a smooth user experience with a minimal app size.

#### Trade-offs
- No Offline Sync: Given the remote-only datasource setup, offline synchronization was not implemented, although the architecture allows for easy extension if needed in the future.
- Limited Animations: To maintain simplicity and focus on core functionality, the use of animations was kept out.

### Previews

<img height="400" alt="Screenshot 2025-03-01 at 15 32 08" src="https://github.com/user-attachments/assets/b702bc8c-f93d-42e7-963f-1462f229570d" />
 &emsp;&emsp;&emsp;
<img height="400" alt="Screenshot 2025-03-01 at 15 31 16" src="https://github.com/user-attachments/assets/f94ff44a-f89c-4177-afbb-19ca5db976fe" />
 &emsp;&emsp;&emsp;
<img height="400" alt="Screenshot 2025-03-01 at 15 31 31" src="https://github.com/user-attachments/assets/f768124a-c833-43ff-9ed0-d478028804a5" /> <br>
Loading Screen  &emsp;&emsp;&emsp; &emsp;&emsp; &emsp;&emsp;   Countries screen  &emsp;&emsp;&emsp; &emsp; &emsp;&emsp;   Country details screen

### Link to download apk - <a href="https://github.com/habyaad/cubex/releases/download/v1.0.2%2B3/app-armeabi-v7a-release.apk">Download Apk</a>
