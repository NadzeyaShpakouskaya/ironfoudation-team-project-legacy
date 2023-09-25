extension Sitter: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
