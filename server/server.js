import { ApolloServer, gql } from 'apollo-server';

// Sample data
const users = [
    { id: '1', name: 'Brandon Flowers', email: 'brandon.flowers@example.com' },
    { id: '2', name: 'Dave Keuning', email: 'dave.keuning@example.com' },
    { id: '3', name: 'Ronnie Vannucci Jr.', email: 'ronnie.vannuccijr@example.com' },
    { id: '4', name: 'Mark Stoermer', email: 'mark.stoermer@example.com' },
  ];

// Schema
const typeDefs = gql`
  type Query {
    getUser(id: ID!): User
  }

  type User {
    id: ID!
    name: String!
    email: String!
  }
`;

// Resolver
const resolvers = {
  Query: {
    getUser: (_, { id }) => {
      const user =  users.find(user => user.id === id);
      if (!user) {
        throw new Error(`User with ID ${id} not found`);
      }
      return user;
    },
  },
};

// Setup server
const server = new ApolloServer({ typeDefs, resolvers });

// Start up server
server.listen().then(({ url }) => {
  console.log(`🚀 Servidor listo en ${url}`);
});