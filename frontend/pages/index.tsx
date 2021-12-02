import React, { VFC } from "react";
import {
  ApolloClient,
  ApolloProvider,
  createHttpLink,
  InMemoryCache,
} from "@apollo/react-hooks";
import SearchSubjectList from "../components/SearchSubjectList";

export const link = createHttpLink({
  uri: process.env.NEXT_PUBLIC_API_SERVER_HOST + "/graphql",
});

const client: ApolloClient<any> = new ApolloClient({
  cache: new InMemoryCache(),
  link,
});

const APP: VFC = () => (
  <ApolloProvider client={client}>
    <div>
      <SearchSubjectList />
    </div>
  </ApolloProvider>
);

export default APP;
