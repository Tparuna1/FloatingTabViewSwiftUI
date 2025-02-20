//
//  ContentView.swift
//  FloatingTabViewSwiftUI
//
//  Created by tornike <parunashvili on 20.02.25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(Tab.home)
                ShopView()
                    .tag(Tab.shop)
                CartView()
                    .tag(Tab.cart)
                ProfileView()
                    .tag(Tab.profile)
            }
            VStack {
                Spacer()
                CustomFloatingTabView(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}



// MARK: - Tab Enum
enum Tab: CaseIterable {
    case home, shop, cart, profile
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .shop: return "bag.fill"
        case .cart: return "cart.fill"
        case .profile: return "person.fill"
        }
    }
}

#Preview {
    MainTabView()
}
