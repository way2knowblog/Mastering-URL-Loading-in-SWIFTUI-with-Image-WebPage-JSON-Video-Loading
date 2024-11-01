//
//  RemoteImageView.swift
//  WebUrlLoadingInSwiftUI
//
//  Created by Balaji A on 01/11/24.
//

import SwiftUI

// MARK: - Image Loading Example
struct RemoteImageView: View {
    
    let randomImageFromUrl = URL(string: "https://picsum.photos/200") // Example image URL and you'll get a random image.
    
    var body: some View {
        AsyncImage(url: randomImageFromUrl) { phase in
            switch phase {
            case .empty:
                ProgressView() // Loading indicator
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            case .failure:
                Image(systemName: "photo.badge.exclamationmark") // Placeholder image if image loading fails.
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            @unknown default:
                EmptyView()
            }
        }
    }
}

// MARK: - RemoteImageView
struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
            .previewLayout(.sizeThatFits)
    }
}

