//
//  EmailUsScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-04-01.
//

import SwiftUI
import MessageUI

struct EmailUsScreen: View {
    @State private var showingMailView = false
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var resultID = UUID()

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "envelope.open.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.green)

            VStack(spacing: 8) {
                Text("Need help or have feedback?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                Text("Tap the button below to send us an email. We'd love to hear from you!")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)

            Button(action: {
                if MailView.canSendMail() {
                    showingMailView = true
                } else {
                    alertMessage = "Mail services are not available on this device."
                    showAlert = true
                }
            }) {
                Text("Send Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .teal]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                    .shadow(color: Color.green.opacity(0.4), radius: 5, x: 0, y: 4)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingMailView, onDismiss: {
            resultID = UUID()
        }) {
            MailView(result: $mailResult)
        }
        .onChange(of: resultID) {
            processMailResult()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Email"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func processMailResult() {
        guard let result = mailResult else { return }

        switch result {
        case .success(let mfResult):
            switch mfResult {
            case .sent:
                alertMessage = "Email sent successfully!"
            case .saved:
                alertMessage = "Email was saved as a draft."
            case .cancelled:
                alertMessage = "Email sending was cancelled."
            case .failed:
                alertMessage = "Failed to send email."
            @unknown default:
                alertMessage = "Unknown result."
            }
        case .failure(let error):
            alertMessage = "Error: \(error.localizedDescription)"
        }

        showAlert = true
    }
}


struct MailView: UIViewControllerRepresentable {
    @Environment(\.dismiss) var dismiss
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView

        init(_ parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                parent.dismiss()
            }
            if let error = error {
                parent.result = .failure(error)
            } else {
                parent.result = .success(result)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(["pikemo5278@naobk.com"])
        vc.setSubject("Feedback from BudgetSense App")
        vc.setMessageBody("Hello, I have some thoughts about the app...", isHTML: false)
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

    static func canSendMail() -> Bool {
        MFMailComposeViewController.canSendMail()
    }
}



#Preview {
    EmailUsScreen()
}
