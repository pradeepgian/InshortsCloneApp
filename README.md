# InshortsClone

InshortsClone is a SwiftUI based iOS application that fetches and displays top news stories from the NY Times API. The app provides a seamless experience similar to the Inshorts News App, allowing users to scroll through articles and load web content for full stories.


## Features

- **Top News Fetching:** Retrieve the latest news articles from an API.
- **Lazy Loading of News Articles:** Efficient loading and rendering using `LazyVStack`.
- **State Management:** Loading, error, and idle states handled with a `ScreenState` enum.
- **Smooth Navigation:** Smooth switching between a list of articles and detailed web content.
- **Paging ScrollView:** Users can swipe through news articles one at a time with paging effect similar to Instagram Reels or TikTok

### Components:

- **UseCase:** `FetchNewsUseCase` and its implementation for fetching news articles.
- **ViewModel:** `NewsViewModel` for maintaining states (loading, error, data).
- **Views:** `NewsListView`, `NewsWebView`, and a custom `NewsCardView` for displaying articles.

![](https://github.com/pradeepgian/InshortsCloneApp/blob/main/InshortsCloneApp.gif)
