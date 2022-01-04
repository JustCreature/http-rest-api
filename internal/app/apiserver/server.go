package apiserver

import (
	"net/http"

	"github.com/JustCreature/http-rest-api/internal/app/store"
	"github.com/gorilla/mux"
	"github.com/sirupsen/logrus"
)

type server struct {
	config *Config
	router *mux.Router
	logger *logrus.Logger
	store  store.Store
}

func newServer(store store.Store, config *Config) (*server, error) {
	s := &server{
		config: config,
		router: mux.NewRouter(),
		logger: logrus.New(),
		store:  store,
	}

	if err := s.configureLogger(); err != nil {
		return nil, err
	}

	s.configureRouter()

	return s, nil
}

func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	s.router.ServeHTTP(w, r)
}

func (s *server) configureRouter() {
	s.router.HandleFunc("/users", s.handleUsersCreate()).Methods("POST")
}

func (s *server) handleUsersCreate() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

	}
}

func (s *server) configureLogger() error {
	// level, err := logrus.ParseLevel(s.config.LogLevel)
	level, err := logrus.ParseLevel("debug")
	if err != nil {
		return err
	}

	s.logger.SetLevel(level)

	return nil
}
