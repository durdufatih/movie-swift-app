//
//
//  Created by Mehmet Fatih Durdu on 09.01.2022.
//

import Foundation

@frozen enum MOEndpoint:String{
    case now_playing = "movie/now_playing"
    case popular = "movie/popular"
    case search = "search/movie"
    case detail = "movie/detail"
}
