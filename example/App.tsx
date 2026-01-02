import { PrivacySensitive } from 'expo-privacy-sensitive';
import { SafeAreaView, StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.header}>Screenshot Protection Demo</Text>

      <View style={styles.card}>
        <Text style={styles.cardTitle}>Unprotected Content</Text>
        <Text style={styles.cardText}>This text is visible in screenshots</Text>
        <Text style={styles.cardText}>Card: 1234 5678 9012 3456</Text>
      </View>

      <PrivacySensitive style={styles.card}>
        <Text style={styles.cardTitle}>Protected Content</Text>
        <Text style={styles.cardText}>This text is hidden in screenshots!</Text>
        <Text style={styles.cardText}>Card: 9876 5432 1098 7654</Text>
        <Text style={styles.cardText}>Balance: $42,000.00</Text>
      </PrivacySensitive>

      <Text style={styles.footer}>
        Take a screenshot - the protected content will be blank!
      </Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    padding: 20,
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    marginVertical: 20,
  },
  card: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 20,
    marginVertical: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  cardTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 12,
  },
  cardText: {
    fontSize: 16,
    color: '#333',
    marginBottom: 8,
  },
  footer: {
    textAlign: 'center',
    color: '#666',
    marginTop: 20,
    fontSize: 14,
  },
});
