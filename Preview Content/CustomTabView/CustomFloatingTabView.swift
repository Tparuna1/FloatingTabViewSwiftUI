//
//  CustomFloatingTabView.swift
//  FloatingTabViewSwiftUI
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

// MARK: - Floating Custom Tab Bar
struct CustomFloatingTabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \ .self) { tab in
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        selectedTab = tab
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                }) {
                    VStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: 22))
                            .foregroundColor(selectedTab == tab ? .blue : .gray)
                            .scaleEffect(selectedTab == tab ? 1.2 : 1.0)
                            .animation(.spring(), value: selectedTab)
                        
                        if selectedTab == tab {
                            Circle()
                                .frame(width: 6, height: 6)
                                .foregroundColor(.blue)
                                .offset(y: 4)
                        }
                    }
                }
                Spacer()
            }
        }
        .frame(height: 64)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 6)
        )
        .padding(.horizontal, 18)
        .padding(.bottom, 12)
    }
}
