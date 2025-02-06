import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = ImageViewModel()
    
    var body: some View {
        NavigationView {
            MainView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("LuminaVision")
                            .font(.system(.title, design: .serif))
                            .foregroundColor(ThemeManager.current.text)
                    }
                }
                .sheet(isPresented: $viewModel.showImagePicker) {
                    ImagePicker(image: Binding(
                        get: { self.viewModel.selectedImage },
                        set: { self.viewModel.handleImageSelection($0) }
                    ))
                }
        }
        .environmentObject(viewModel)
    }
}

// 圖片選擇器
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()
            
            guard let provider = results.first?.itemProvider else { return }
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.image = image as? UIImage
                    }
                }
            }
        }
    }
}
