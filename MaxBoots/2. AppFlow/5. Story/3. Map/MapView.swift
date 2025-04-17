import SwiftUI
import MapKit

struct MapView: View {
    @StateObject
    private var mapViewModel = MapViewModel()
    
    @State
    private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State
    private var isAnimating: Bool = false
    
    let goToStoryMenu: () -> Void
    let goToGame: () -> Void
    
    var body: some View {
        VStack {
            Map(position: $cameraPosition) {
                UserAnnotation()
                
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 42.270535, longitude: 42.705118)) {
                    VStack {
                        Image(.shop1)
                            .resizable()
                            .frame(width: 70, height: 50)
                        
                        Text("Fresh Boots")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        mapViewModel.selectTrustedShop()
                    }
                }
                
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 42.263389, longitude: 42.709241)) {
                    VStack {
                        Image(.shop2)
                            .resizable()
                            .frame(width: 40, height: 50)
                        
                        Text("Two Steps")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        mapViewModel.selectSecondShop()
                    }
                }
                
                Annotation("", coordinate: CLLocationCoordinate2D(latitude: 42.254100, longitude: 42.709003)) {
                    VStack {
                        Image(.shop3)
                            .resizable()
                            .frame(width: 60, height: 60)
                        
                        Text("Good Luck")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        mapViewModel.selectChineseShop()
                    }
                }
            }
        }
        .overlay(content: title)
        .overlay(content: back)
        .overlay(content: details)
        .alert("Товаров нет!", isPresented: $mapViewModel.showNoItemsAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Ждём новую поставку, сходите в другой магазин")
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isAnimating = true
            }
        }
    }
    
    @ViewBuilder
    private func details() -> some View {
        if mapViewModel.isShowShopDetails {
            Rectangle()
                .frame(width: 300, height: 400)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    VStack {
                        Text("\(mapViewModel.currentShop.name)")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                            .italic()
                            .foregroundStyle(.customBrown)
                            .padding(.horizontal)
                        
                        Image("\(mapViewModel.currentShop.image)")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text("\(mapViewModel.currentShop.description)")
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
                .overlay {
                    HStack {
                        Button(action: mapViewModel.closeDetails) {
                            Text("Не сегодня")
                                .bold()
                                .font(.title2)
                                .accentColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        Button(action: goToGame) {
                            Text("Зайти")
                                .bold()
                                .font(.title2)
                                .accentColor(.customBrown)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()
                    .padding(.horizontal)
                }
        }
    }
    
    @ViewBuilder
    private func back() -> some View {
        Button(action: goToStoryMenu) {
            UniversalLabel(text: "Вернуться")
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text("Карта")
            .foregroundStyle(.customBrown)
            .bold()
            .italic()
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 35)
            .opacity(isAnimating ? 1 : 0)
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        .init(latitude: 42.26, longitude: 42.705)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        .init(center: .userLocation,
              latitudinalMeters: 3000,
              longitudinalMeters: 3000)
    }
}

#Preview {
    MapView(goToStoryMenu: {}, goToGame: {})
}
