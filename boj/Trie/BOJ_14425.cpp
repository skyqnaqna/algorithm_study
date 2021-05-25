// 백준 14425 문자열 집합
// 21.05.25
#include <iostream>
#include <cstdio>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

struct Trie
{
    bool isEnd;
    Trie* children[26];

    Trie(): isEnd(false)
    {
        fill(children, children + 26, nullptr);
    }

    ~Trie()
    {
        for (int i = 0; i < 26; ++i)
        {
            if (children[i])
                delete children[i];
        }
    }

    void insert (const char* key)
    {
        if (*key == '\0')
        {
            isEnd = true;
        }
        else
        {
            int index = *key - 'a';

            if (children[index] == nullptr)
                children[index] = new Trie();
            children[index]->insert(key + 1);
        }
    }

    Trie* find(const char* key)
    {
        if (*key == 0)
        {
            return this;
        }

        int index = *key - 'a';
        if (children[index] == 0)
            return NULL;

        return children[index]->find(key + 1);
    }

    bool contain(const char* key)
    {
        if (*key == 0 && isEnd)
            return true;

        int index = *key - 'a';
        if (children[index] == nullptr)
            return false;

        return children[index]->contain(key + 1);
    }
};

int main (){

    Trie * root = new Trie();

    int n, m; scanf("%d %d", &n, &m);

    for (int i = 0; i < n; ++i)
    {
        char word[501];
        scanf("%s", word);
        root->insert(word);
    }

    int answer = 0;
    for (int i = 0; i < m; ++i)
    {
        char word[501];
        scanf("%s", word);
        if (root->contain(word))
            ++answer;
    }

    printf("%d\n", answer);

    delete root;

    return 0;
}
