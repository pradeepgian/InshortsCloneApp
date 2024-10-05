//
//  NewsViewModel.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 14/09/24.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var screenState: ScreenState = .idle

    private let fetchNewsUseCase: FetchNewsUseCase
    private var cancellables: Set<AnyCancellable> = []

    init(fetchNewsUseCase: FetchNewsUseCase) {
        self.fetchNewsUseCase = fetchNewsUseCase
    }

    func loadTopStories() {
        screenState = .loading
        fetchNewsUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    self.screenState = .complete
                case .failure(let error):
                    self.screenState = .error(error)
                }
            }, receiveValue: { [weak self] articles in
                guard let self = self else { return }
                self.articles = articles
            })
            .store(in: &cancellables)
    }
}




