#include <bits/stdc++.h>
using namespace std;

#define f first
#define s second
#define pb push_back
#define all(c) c.begin(),c.end()

#define gi(x) scanf("%d", &x)
#define pi(x) printf("%d", x)
#define gl(x) scanf("%lld", &x)
#define pl(x) printf("%lld", x)
#define sp printf(" ")
#define nl printf("\n")

typedef long long int lld;
typedef long double ldb;

struct ste{
	int par;
	int rank;
};	

ste* dsu;

int fnd(int i){
	if(i!=dsu[i].par) dsu[i].par = fnd(dsu[i].par);
	return dsu[i].par;
}

void join(int i, int j){
	int x = fnd(i);
	int y = fnd(j);
	if(x == y) return;
	if(x > y){
		dsu[y].par = x;
	}
	else if(x < y){
		dsu[x].par = y;
	}
	else{
		dsu[x].par = y;
		dsu[y].rank++;
	}
}

vector <int> p[110];

main(){
	int n;
	cin >> n;
	dsu = new ste[n+2];
	for(int i = 1; i <= n; i++) {
		dsu[i].rank = 1;
		dsu[i].par = i;
	}
	int e;
	cin >> e;
	for(int i = 0, x, y; i < e; i++){
		cin >> x >> y;
		join(x,y);
	}
	for(int i = 1; i <= n; i++){
		p[fnd(i)].pb(i);
	}
	for(int i = 0; i < 100; i++){
		if(p[i].size()>0){
			cout << "group " << i << endl;
			for(auto j: p[i]){
				cout << j << ' ';
			}
			cout << endl;
		}
	}
}
