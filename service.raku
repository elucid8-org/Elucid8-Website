use Cro::HTTP::Server;
use Elucid8::Routes;

my Cro::Service $http = Cro::HTTP::Server.new(
    http => <1.1>,
    host => %*ENV<WEBSITE_HOST> ||
        die("Missing WEBSITE_HOST in environment"),
    port => %*ENV<WEBSITE_PORT> ||
        die("Missing WEBSITE_PORT in environment"),
    application => routes(),
);
$http.start;
say "Listening at http://%*ENV<WEBSITE_HOST>:%*ENV<WEBSITE_PORT>";
react {
    whenever signal(SIGINT) {
        say "Shutting down...";
        $http.stop;
        done;
    }
}
