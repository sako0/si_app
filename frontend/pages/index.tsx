import React from "react";
import {
  ApolloClient,
  ApolloProvider,
  createHttpLink,
  InMemoryCache,
} from "@apollo/react-hooks";
import SearchSubjectList from "../components/SearchSubjectList";

export const link = createHttpLink({
  uri: "http://localhost:3000/graphql",
});

const client: ApolloClient<any> = new ApolloClient({
  cache: new InMemoryCache(),
  link,
});

const APP = () => (
  <ApolloProvider client={client}>
    <div>
      <SearchSubjectList />
    </div>
  </ApolloProvider>
);

export default APP;
