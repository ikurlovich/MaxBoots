import AVFoundation

final class SoundManager: ObservableObject {
    private var player: AVAudioPlayer?
    
    func playMusic(named name: String, fileExtension: String = "mp3", loops: Bool = true) {
        guard let url = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
            print("⚠️ Аудиофайл не найден: \(name).\(fileExtension)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = loops ? -1 : 0
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("❌ Ошибка воспроизведения: \(error.localizedDescription)")
        }
    }
    
    func stop() {
        player?.stop()
    }
    
    func pause() {
        player?.pause()
    }
    
    func resume() {
        player?.play()
    }
    
    var isPlaying: Bool {
        player?.isPlaying ?? false
    }
}
