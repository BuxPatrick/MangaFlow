//
//  LastReadChapter.swift
//  MangaFlow
//
//

import Foundation

struct LastReadChapter : Codable, Identifiable{
    let id : String
    let MangaDetail : Manga
    var Chapter : FeedChapter
}

func GetLastRead() -> [LastReadChapter]{
    do{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = paths[0].appendingPathComponent("LastReadChapters.json")
        var dataInitLastRead = try Data(contentsOf: fileURL)
        var dataArray = try JSONDecoder().decode([LastReadChapter].self, from: dataInitLastRead)
        return dataArray
    }catch{
        print("Computed Var Failed Init \nError is \(error.localizedDescription)")
        return []
    }
}

func appendToLastReadChapters(_ lastRead : LastReadChapter){
    var lastReadChapters = GetLastRead()
    
    if let sameManga = lastReadChapters.firstIndex(where: {$0.id == lastRead.id}){
        lastReadChapters[sameManga] = lastRead
    }else{
        lastReadChapters.append(lastRead)
    }
    updateLastReadChapter(with: lastReadChapters)
}

func updateLastReadChapter(with newLastRead : [LastReadChapter]){
    
    do{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = paths[0].appendingPathComponent("LastReadChapters.json")
     
        try JSONEncoder().encode(newLastRead).write(to: fileURL)
        print("FInshed Encoding")
        
        var jsonData = try Data(contentsOf: fileURL)
        var finalData = try JSONDecoder().decode([LastReadChapter].self, from: jsonData)
      //  print("Fianl Data is \(finalData)")
    }catch{
        print(error)
    }
    
}
