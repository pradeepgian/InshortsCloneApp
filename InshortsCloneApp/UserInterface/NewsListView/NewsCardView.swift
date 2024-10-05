//
//  NewsCardView.swift
//  InshortsClone
//
//  Created by Pradeep Gianchandani on 08/09/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCardView: View {
    let article: NewsArticle
    let imageWidth: CGFloat
    var body: some View {
            VStack(spacing: 0) {
                WebImage(url: article.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageWidth)
                        .clipped()
                    } placeholder: {
                        Rectangle()
                            .frame(width: imageWidth, height: imageWidth)
                            .foregroundStyle(Color(.label))
                    }

                VStack(alignment: .leading, spacing: 10) {
                    Text(article.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        .padding([.horizontal, .top])

                    Text(article.summary)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.primary)
                        .padding([.horizontal, .bottom])
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .containerRelativeFrame([.horizontal, .vertical])
    }
}



